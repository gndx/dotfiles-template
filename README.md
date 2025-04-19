# Dotfiles para macOS

Configuración personalizada de entorno de desarrollo para macOS. Este repositorio contiene los archivos de configuración (dotfiles) y un script de instalación automatizado para configurar rápidamente un nuevo entorno de desarrollo en macOS.

## 🚀 Características

- Instalación automatizada de:

  - [Homebrew](https://brew.sh/) y paquetes comunes
  - [Oh My Zsh](https://ohmyz.sh/) con tema [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
  - [NVM](https://github.com/nvm-sh/nvm) (Node Version Manager)
  - [GitMoji](https://gitmoji.dev/) para commits expresivos

- Configuraciones personalizadas:
  - `.zshrc` con aliases útiles para desarrollo
  - `.gitconfig` con configuración para firma de commits
  - `.p10k.zsh` con configuración de tema Powerlevel10k
  - `.zprofile` para inicialización de Homebrew

## 📋 Prerequisitos

- macOS (optimizado para la última versión)
- Acceso de administrador para instalación de paquetes

## 🔧 Instalación

1. Clona este repositorio en tu directorio home:

```bash
git clone https://github.com/gndx/dotfiles.git ~/dotfiles
```

2. Ejecuta el script de instalación:

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## ⚙️ Componentes

### Directorios creados

- `~/develop` - Directorio principal de desarrollo
- `~/develop/gndx` - Proyectos personales
- `~/develop/platzi` - Proyectos relacionados con Platzi

### Aplicaciones instaladas (via Homebrew)

- Google Chrome
- AppCleaner
- Postman
- Visual Studio Code
- Cursor
- Spotify
- OBS
- Audacity
- Ollama

### Configuración Git

Incluye configuración para firmar commits usando SSH con 1Password.

### Aliases

Algunos aliases útiles incluidos:

- `develop` - Navega al directorio de desarrollo
- `zshrc` - Abre .zshrc en VSCode
- `dev`, `gndx`, `platzi` - Navegación rápida a directorios de desarrollo
- `commit` - Muestra estado y prepara un commit con GitMoji
- Varios aliases para trabajo con Git

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor, siente libre de enviar un PR o abrir un issue.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo LICENSE para más detalles.

## 👨‍💻 Autor

- Oscar Barajas [@gndx](https://github.com/gndx)
