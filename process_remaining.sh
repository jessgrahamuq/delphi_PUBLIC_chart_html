#!/bin/bash

# Process remaining qual_summary.html files
cd /Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html

echo "Processing remaining qual_summary.html files..."

# Find all remaining files
find 1.3 3.2 4.1 5.1 6.4 -name "*qual_summary.html" | while read file; do
    echo "Processing: $file"

    # 1. Add min-width: 0; to .content-grid rule
    sed -i '' 's/\(\.content-grid[^}]*gap: 10px;\)/\1\
            min-width: 0;/' "$file"

    # 2. Add min-width and overflow-wrap to .content-column rule
    sed -i '' 's/\(\.content-column[^}]*padding: 8px;\)/\1\
            min-width: 0;\
            overflow-wrap: break-word;/' "$file"

    # 3. Remove @media block (this is more complex with sed, so we'll handle it separately)
    # Remove the entire @media block
    sed -i '' '/^[[:space:]]*@media (max-width: 768px) {/,/^[[:space:]]*}[[:space:]]*$/d' "$file"

done

echo "Processing complete!"

# Count files processed
echo "Total files processed: $(find 1.3 3.2 4.1 5.1 6.4 -name "*qual_summary.html" | wc -l)"