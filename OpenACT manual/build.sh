#!/bin/bash

for file in *.md; do
    filename="${file%.md}"
    
    echo "Converting $file to PDF..."
    pandoc "metadata_$filename.yaml" "$file" -o "$filename.pdf" --from markdown --template "../eisvogel.tex" --listings

    echo "Converting $file to Word (.docx)..."
    pandoc "$file" -o "$filename.docx" --from markdown

    echo "Done processing $file"
done


echo "Converting all files to PDF..."

pandoc metadata.yaml *.md \
  -o modules.pdf \
  --from markdown \
  --template "../eisvogel.tex" \
  --listings \
  --toc \
  --pdf-engine=xelatex \
  -V colorlinks=true


echo "Converting all files to Word (.docx)..."

pandoc metadata.yaml *.md \
  -o modules.docx \
  --from markdown \
  --listings \
  --toc

echo "All conversions completed!"
