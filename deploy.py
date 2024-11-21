import os

ROOT_DIR = os.path.dirname(os.path.realpath(__file__))
HOME_DIR = os.path.expanduser('~')
CONFIG_DIRS = ['vim', 'tmux', 'yabai', 'skhd', 'aerospace']

# Create symlinks for config files:
for config_dir in CONFIG_DIRS:
    dirname = os.path.join(ROOT_DIR, config_dir)
    for filename in os.listdir(dirname):
        linkname = os.path.join(HOME_DIR, filename)
        filename = os.path.join(dirname, filename)
        if os.path.exists(linkname):
            print("[{}] Symlink already exists: {}".format(config_dir, filename, linkname))
        else:
            os.symlink(filename, linkname)
            print("[{}] Linked: {} -> {}".format(config_dir, filename, linkname))

# Symlink vim configs to nvim dirs also:
filename = os.path.join(ROOT_DIR, 'nvim')
linkname = os.path.join(HOME_DIR, '.config', 'nvim')
os.symlink(filename, linkname)
print("[nvim] Linked: {} -> {}".format(filename, linkname))


# Clone Vundle
vundle_path = os.path.join(HOME_DIR, ".vim", "bundle", "Vundle.vim")
cmd = "git clone https://github.com/VundleVim/Vundle.vim.git {}".format(vundle_path)
print("[Vundle] {}".format(cmd))
os.system(cmd)
