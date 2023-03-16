mkdir web
cd web
npm init -y
mkdir public src
touch public/index.html
#copy in boilderplate to public/index.html
npm install --save-dev @babel/core @babel/cli @babel/preset-env @babel/preset-react
touch .babelrc
#copy in boilderplate to .baberc
npm install --save-dev webpack webpack-cli webpack-dev-server style-loader css-loader babel-loader file-loader
touch webpack.config.js
#copy in boilderplate to webpack.config.js

npm install react react-dom
touch src/index.js
#copy in boilderplate to src/index.js
#copy in boilderplate to src/App.js
#copy in boilderplate to src/App.css

add webpack-dev-server --mode development in "start" script of package.json
add webpack --mode development in "build" script of package.json

npm i -g pm2
touch ecosystem.config
#copy boilderplate to ./ecosystem.config
#copy public/index.html to ./dist/
pm2 start ecosystem.config.js