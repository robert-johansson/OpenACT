#!/bin/bash

for file in *.md; do
    filename="${file%.md}"
    
    echo "Converting $file to PDF..."
    pandoc "$file" -o "$filename.pdf" --from markdown --template "../eisvogel.tex" --listings

    echo "Converting $file to Word (.docx)..."
    pandoc "$file" -o "$filename.docx" --from markdown

    echo "Done processing $file"
done

echo "All conversions completed!"
