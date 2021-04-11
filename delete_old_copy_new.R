# script to delete contents of this folder and replace it with the contents of the vernon_gitbook docs/ folder

# delete the folders and everything in them
system("rm -r assets")
system("rm -r css")
system("rm -r media")
# list.files automatically doesn't include files starting with . so .gitignore isn't included
files <- list.files()
files_to_delete <- files[!grepl("Rproj|delete_old_copy_new", files)]
file.remove(files_to_delete)

# now there are only the .gitignore file and the wmattbrown.github.io.Rproj files
system("cp -r ../vernon_gitbook/docs/* ./")

system("git add .")
system("git commit -m 'updating journal entries'")
system("git push -u origin main")
