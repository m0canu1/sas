mkdir -p PDFS
for var in "$@"
do
	fbname=$(basename "$var" .md)
	pandoc $fbname.md -o PDFS/$fbname.pdf --filter pandoc-plantuml
done
