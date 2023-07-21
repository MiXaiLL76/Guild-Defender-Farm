import zipfile
import glob
import os
import os.path as osp

def main():
    with zipfile.ZipFile('GuildDefenderFarm.zip', 'w', allowZip64=True, compression=zipfile.ZIP_DEFLATED, compresslevel=9) as myzip:
        for file in glob.glob('./**', recursive=True):
            if '.zip' in file:
                continue

            print(file)
            myzip.write(file, osp.join('GuildDefenderFarm', file))

if __name__ == "__main__":
    main()