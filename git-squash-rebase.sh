#get current branch
#git rev-parse --abbrev-ref HEAD

#get first commit of a branch
#git log master..features --oneline | tail -1

#get parent commit
#git rev-parse commit^

# squash branch into 1 commit
current_branch=`git rev-parse --abbrev-ref HEAD`
first_commit=`git log master..$current_branch --oneline | tail -1 | awk -F ' ' '{print $1}'`
one_before=`git rev-parse $first_commit^`
echo $one_before
git rebase -i $one_before

# update branch
git checkout master
git pull origin master
git checkout $current_branch
git rebase master
