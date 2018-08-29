SET RepositoryUrl="https://github.com/lars-wobus/unity-test-git-submodules"
SET RepositoryName="unity-test-git-submodules"
SET LocalDirectory="subtrees/"%RepositoryName%
SET ForkedRepositoryUrl="XXXX"

:: Add local repository to refer to it in shorter form. Omit --squash to preserve the entire history of the subproject!
git remote add -f %RepositoryName% %RepositoryUrl%
git subtree add --prefix %LocalDirectory% %RepositoryName% master --squash

:: Later in the development, get latest changes
git fetch %RepositoryName% master
git subtree pull --prefix %LocalDirectory% %RepositoryName% master --squash

:: When original repository should be updated. Fork this repository, push changes to the new repo and create a pull request to inform author of the original repository.
git remote add %RepositoryName% %ForkedRepositoryUrl%
git subtree push --prefix=%LocalDirectory% %RepositoryName% master