
import argparse
import os
import sys
import json

def sudo_apt_install(prog_list: list): 
    cmdline = "sudo apt install "
    print("sudo apt install {} ...".format(prog_list)) 
    for prog in prog_list: 
        os.system(cmdline + prog)

def install_sublime(): 
    os.system("wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -")
    os.system("echo \"deb https://download.sublimetext.com/ apt/stable/\" | sudo tee /etc/apt/sources.list.d/sublime-text.list")
    os.system("sudo apt-get update")
    os.system("sudo apt-get install sublime-text")

def install_git_lfs():
    os.system("curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash")
    os.system("sudo apt-get install git-lfs")
    os.system("git lfs install")

def install_p4merge(): 
    os.system("cd ~/Downloads; wget https://cdist2.perforce.com/perforce/r18.2/bin.linux26x86_64/p4v.tgz")
    os.system("cd ~/Downloads; tar zxvf p4v.tgz")
    os.system("sudo mkdir -p /opt/p4v")
    os.system("cd ~/Downloads/p4v-2018.2.*; sudo rm -rf /opt/p4v/* ; sudo mv * /opt/p4v")
    os.system("sudo ln -s /opt/p4v/bin/p4merge /usr/local/bin/p4merge")

if __name__ == "__main__":
    parser = argparse.ArgumentParser("Linux Environment Setup")
    parser.add_argument('config_file',
                        nargs=1,
                        help="Path to config file"
                        )

    parsed_args = parser.parse_args()

    config_file = parsed_args.config_file[0]

    print("Config file is {}".format(config_file))

    try:
        with open(config_file, encoding='utf-8') as data_file:
            config_json = json.load(data_file)
    except FileNotFoundError:
        raise FileNotFoundError(
            "Cannot find config file {}", config_file)
    except json.JSONDecodeError as e:
        raise json.JSONDecodeError("SyntaxError", e.doc, e.pos)

    # Install progs using sudo apt install 
    sudo_apt_install_list = config_json["sudo_apt"]["packages"] 
    
    # sudo apt install programs 
    sudo_apt_install(sudo_apt_install_list)

    # Special Installations 
    # * Sublime 
    install_sublime()  
    # * Git LFS 
    install_git_lfs()
    # * P4merge 
    install_p4merge() 
