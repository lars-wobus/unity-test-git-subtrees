SET RepositoryUrl="https://github.com/lars-wobus/unity-test-git-submodules"
SET RepositoryName="unity-test-git-submodules"
SET LocalDirectory="subtrees/"%RepositoryName%
SET ForkedRepositoryName="XX"
SET ForkedRepositoryUrl="XXXX"

:: Add local repository to refer to it in shorter form. Omit --squash to preserve the entire history of the subproject!
git remote add -f %RepositoryName% %RepositoryUrl%
git subtree add --prefix %LocalDirectory% %RepositoryName% master --squash

:: Later in the development, get latest changes
git fetch %RepositoryName% master
git subtree pull --prefix %LocalDirectory% %RepositoryName% master --squash

:: When changes in a subtree should be published in its original remote repository, there are two way to accomplish that.
:: Method 1: When you are the author of the original repository, you can simply execute the next command
subtree push --prefix= %LocalDirectory% %RepositoryName% master
:: Method 2: When you are not the author of the original repository, you have to fork this project , push changes to the new repository and create pull requests to inform the original author about your changes.
git remote add %ForkedRepositoryName% %ForkedRepositoryUrl%
git subtree push --prefix=%LocalDirectory% %ForkedRepositoryName% master

:: Check remote repositories
git remote -v
