import os

legacy_dir = "c:/Users/Dell/OneDrive/Desktop/star-hms/_legacy"
mdb_files = []
for root, dirs, files in os.walk(legacy_dir):
    for file in files:
        if file.lower().endswith(".mdb"):
            mdb_files.append(os.path.join(root, file))

print("Found MDB files:")
for f in mdb_files:
    print(f)
