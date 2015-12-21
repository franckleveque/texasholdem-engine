 echo -e "Starting to update bin\n"

  #copy data we're interested in to other place
  cp -R bin $HOME/bin

  #go to home and setup git
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"

  #using token clone gh-pages branch
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/franckleveque/texasholdem-engine.git binaries > /dev/null

  #go into diractory and copy data we're interested in to that directory
  cd binaries/bin
  cp -Rf $HOME/bin/* .

  #add, commit and push files
  git add -f .
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to binaries"
  git push -fq origin binaries > /dev/null

  echo -e "Done magic with bin\n"
