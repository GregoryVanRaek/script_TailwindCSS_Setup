echo "IMPORTANT : PLEASE NOTE THAT YOU MUST HAVE INSTALL NODE.JS BEFORE LAUNCHING THIS SCRIPT. IF YOU DIDN'T, GO 
TO HTTPS://NODEJS.ORG/"
echo "Continue ?(y/n)"
  read continue
while [ "$continue" != "y" ] && [ "$continue" != "n"] 
  do
    read continue
  done

if [ "$continue" = "y" ]
 then
  # Initializing npm
  npm init -y

  # Installing tailwindcss
  npm install -D tailwindcss
  npx tailwindcss init

  # Creating workings files
  touch index.html
  echo "<!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="public/output.css" rel="stylesheet">
    <script src="./script.js" defer></script>
    <title>My Project</title>
  </head>
    <body>
      <header>

      </header>
      
      <main>
        <section>
          <h1 class='text-white bg-black text-2xl font-bold'>Tailwindcss title</h1>
        </section>
      </main>

      <footer>

      </footer>
    </body>
  </html>" > index.html
  
  touch script.js
  
  mkdir src
  touch src/input.css
  
  mkdir public
  touch public/output.css
  
  # Configurating src/input.css
  echo '
  @tailwind base;
  @tailwind components;
  @tailwind utilities;' > src/input.css
  
  # Compilation source file
  npx tailwindcss build -i src/input.css -o public/output.css
  
  # Updating tailwind.config.js with corrects paths
  echo "
    /** @type {import('tailwindcss').Config} */
    module.exports = {
    content: ['./index.html', './src/**/*.js', './script.js'],
    theme: {
      extend: {},
    },
    plugins: [],
  }" > tailwind.config.js
  
  echo "Configuration finished. Launch your project with vscode or other text-editor."
  echo "In the terminal, use the following command to see your changes live"
  echo "npx tailwindcss -i ./src/input.css -o ./public/output.css --watch"
  rm ./setup_tailwindcss.sh
fi
