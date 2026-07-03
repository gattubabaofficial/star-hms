import zipfile
import os

zip_path = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\Hospital\HmsData\Getw2014\Hms_GETW2014_150309 rescue.zip"

try:
    with zipfile.ZipFile(zip_path, 'r') as z:
        names = z.namelist()
        print(f"Total files in rescue zip: {len(names)}")
        # Print matching filenames
        filenames = ["desgmast", "deptmast", "acnthead", "stsnmast", "lgrview", "empmast", "prodmast"]
        for name in names:
            name_lower = name.lower()
            for fn in filenames:
                if fn in name_lower:
                    print(f"  Match: {name}")
except Exception as e:
    print(f"Error: {e}")
