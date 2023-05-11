from zipfile import ZipFile
import glob
import os
import os.path as osp

def main():
    with ZipFile('GuildDefenderFarm.zip', 'w') as myzip:
        for file in glob.glob('./**', recursive=True):
            if '.zip' in file:
                continue

            print(file)
            myzip.write(file, osp.join('GuildDefenderFarm', file))

if __name__ == "__main__":
    main()