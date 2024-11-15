# Linux Basic Application Installation Script

## To run this open terminal and run the following command:

```bash
wget https://raw.githubusercontent.com/rainpvtdev/linux-setup/refs/heads/main/basic_installation.sh && chmod +x basic_installation.sh && ./basic_installation.sh
```

- It will ask your sudo password
- If some installation fails, it will list the failed installations at the end of the process.

## Change your system default password using the following command

```bash
passwd
```

## List of basic commands for daily use

1. <b>ls - List Directory Contents</b>

- The ls command is used to list directory contents.
  - Example:

```bash
ls [options] [Folder Name]

ls Desktop/
ls -a
ls
```

2. <b>cd - Change Directory</b>

- The cd command is used to change the current working directory.
  - Example:

```bash
cd [directory]

cd Desktop/
```

3. <b>pwd - Print Working Directory</b>

- The pwd command displays the current working directory.
  - Example:

```bash
pwd
```

4. <b>mkdir - Make Directory</b>

- The mkdir command is used to create a new directory.
  - Example:

```bash
mkdir [directory_name]

mkdir new_folder
```

5. <b>rm - Remove</b>

- The rm command is used to remove files or directories.
  - Example:

```bash
rm [options] [file/directory]

rm new_file
rm -rf foldername
```

#### Note: Be extra careful of using `*`, rather then using `*` always use folder name to delete

6. <b>cp - Copy</b>

- The cp command is used to copy files or directories.
  - Example:

```bash
cp [options] [source] [destination]

cp file1.txt file2.txt
cp /source_path/file /destination_path/file
```

7. <b>mv - Move</b>

- The mv command is used to move files or directories.
  - Example:

```bash
mv [options] [source] [destination]

mv file1.txt /path/to/new/location
```

8. <b>touch - Create Empty File</b>

- The touch command is used to create an empty file.
  - Example:

```bash
touch [file_name]

touch newfile.txt
```

9. <b>cat - Concatenate and Display</b>

- The cat command is used to display the contents of a file.
  - Example:

```bash
cat [file]

cat newfile.txt
```

10. <b>nano - Text Editor</b>

- The nano command launches the Nano text editor.
  - Example:

```bash
nano [file_name]

nano newfile.txt
```

11. <b>apt-get - Package Manager</b>

- The apt-get command is used to manage software packages.
  - Example:

```bash
sudo apt-get [options] [command]

sudo apt-get install package_name
```

12. <b>wget - Download</b>

- The wget command is used to download files from the internet.
  - Example:

```bash
wget - Download

wget http://example.com/file.zip
```

13. <b>tar - Tape Archive</b>

- The tar command is used to create and extract tar archives.
  - Example:

```bash
tar [options] [archive_name.tar.gz] [files/directories]

tar -cvzf archive.tar.gz directory
```

14. <b>du - Disk Usage</b>

- The du command is used to estimate file and directory space usage.
  - Example:

```bash
du [options] [directory]

du -sh /path/to/directory
```

15. <b>df - Disk Free</b>

- The df command displays disk space usage for filesystems.
  - Example:

```bash
df [options]

df -h
```
