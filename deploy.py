import os

ROOT_DIR = os.path.dirname(os.path.realpath(__file__))
HOME_DIR = os.path.expanduser('~')
APPS = ['vim', 'tmux', 'yabai', 'skhd']

# Create symlinks for config files:
for config_type in APPS:
    dirname = os.path.join(ROOT_DIR, config_type)
    for filename in os.listdir(dirname):
        linkname = os.path.join(HOME_DIR, filename)
        filename = os.path.join(dirname, filename)
        if os.path.exists(linkname):
            print("[{}] Symlink already exists: {}".format(config_type, filename, linkname))
        else:
            os.symlink(filename, linkname)
            print("[{}] Linked: {} -> {}".format(config_type, filename, linkname))

# Clone Vundle
vundle_path = os.path.join(HOME_DIR, ".vim", "bundle", "Vundle.vim")
cmd = "git clone https://github.com/VundleVim/Vundle.vim.git {}".format(vundle_path)
print("[Vundle] {}".format(cmd))
os.system(cmd)
