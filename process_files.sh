#!/bin/bash

# List of all files to process
files=(
"/Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html/2.2/2.2_sectors_vulnerability_group1_qual_summary.html"
"/Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html/2.2/2.2_sectors_vulnerability_group2_qual_summary.html"
"/Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html/2.2/2.2_sectors_vulnerability_group3_qual_summary.html"
"/Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html/2.2/2.2_sectors_vulnerability_group4_qual_summary.html"
"/Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html/2.2/2.2_sectors_vulnerability_qual_summary.html"
"/Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html/2.2/2.2_vulnerability_optional_qual_summary.html"
"/Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html/2.2/2.2_vulnerability_required_qual_summary.html"
)

for file in "${files[@]}"; do
    echo "Processing: $file"
    # The Claude agent will handle each file individually
done