import os

ROOT_DIR = os.path.dirname(os.path.realpath(__file__))

for config_type in ['vim', 'tmux']:
    dirname = os.path.join(ROOT_DIR, config_type)
    for filename in os.listdir(dirname):
        linkname = os.path.join(os.path.expanduser('~'), filename)
        filename = os.path.join(dirname, filename)
        print "[{}] Linked: {} -> {}".format(config_type, filename, linkname)
        os.symlink(filename, linkname)

