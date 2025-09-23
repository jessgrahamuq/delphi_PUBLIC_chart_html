#!/usr/bin/env python3
"""
Script to apply CSS changes to all qual_summary.html files
"""
import os
import re
import glob

# Base directory
base_dir = "/Users/universityofqueensland/Desktop/delphi_PUBLIC_chart_html"

# Target directories
directories = ["1.3", "2.2", "3.2", "4.1", "5.1", "6.4"]

# Changes to make
def apply_changes(content):
    # 1. Update .content-grid rule
    content = re.sub(
        r'(\s+\.content-grid\s*\{[^}]*grid-template-columns:\s*1fr\s+1fr;\s*gap:\s*10px;)\s*(\})',
        r'\1\n            min-width: 0;\2',
        content
    )

    # 2. Update .content-column rule
    content = re.sub(
        r'(\s+\.content-column\s*\{[^}]*padding:\s*8px;)\s*(\})',
        r'\1\n            min-width: 0;\n            overflow-wrap: break-word;\2',
        content
    )

    # 3. Remove @media block entirely
    content = re.sub(
        r'\s*@media\s*\([^}]*max-width:\s*768px[^}]*\)\s*\{[^}]*\}',
        '',
        content,
        flags=re.DOTALL
    )

    return content

def process_files():
    total_files = 0
    processed_files = 0

    for directory in directories:
        pattern = os.path.join(base_dir, directory, "*qual_summary.html")
        files = glob.glob(pattern)

        for file_path in files:
            total_files += 1
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()

                # Check if changes are needed
                if ('.content-grid' in content and
                    'min-width: 0;' not in content and
                    'overflow-wrap: break-word;' not in content):

                    new_content = apply_changes(content)

                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(new_content)

                    processed_files += 1
                    print(f"Processed: {file_path}")
                else:
                    print(f"Skipped (already processed): {file_path}")

            except Exception as e:
                print(f"Error processing {file_path}: {e}")

    print(f"\nSummary: Processed {processed_files} out of {total_files} files")

if __name__ == "__main__":
    process_files()