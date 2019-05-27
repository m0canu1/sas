```plantuml
Actor User
Participant rM
Participant currentR
opt
    User -> rM: addAlternatives()
    Activate rM
    alt ["currentrecipe!=null"]
        rM --> User: throw UseCaseLogicException
    else
        rM -> currentR: addAlternatives()
        Activate currentR
        loop forever
            create "r: AlternativeRecipe"
            currentR -> "r: AlternativeRecipe": addTitle(title, String)
            Activate "r: AlternativeRecipe"
            "r: AlternativeRecipe" -> "r: AlternativeRecipe": setTitle("title+String")
            "r: AlternativeRecipe" -> "r: AlternativeRecipe": setPubblicata(false)
            currentR -> "r: AlternativeRecipe": addSteps("Steps:List<step>")
            "r: AlternativeRecipe" -> "r: AlternativeRecipe": setSteps("Steps:List<step>")
            loop forever
                "r: AlternativeRecipe" -> "r: AlternativeRecipe": setIngredients(String)
                "r: AlternativeRecipe" -> "r: AlternativeRecipe": setDoses(Int)
            end
        end
        "r: AlternativeRecipe" --> currentR: r
        Deactivate "r: AlternativeRecipe"
        currentR --> rM: r
        Deactivate currentR
        rM -> rM: addRecipe(r)
        rM --> User
        Deactivate rM
    end
end
```
