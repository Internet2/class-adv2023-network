# library
import os
import sys
from pathlib import Path
import pprint
import configparser
import json

# installed
import dotenv
import python_terraform as ptf
from python_terraform import IsFlagged, IsNotFlagged




def load_env(
    env_file_path: str="./config/test.env"
) -> None:

    # load environment variables
    dotenv.load_dotenv(env_file_path)

    config = configparser.ConfigParser()
    config.read("./config/backend.ini")
    
    # Convert INI sections and options to a dictionary
    config_dict = {}
    for section in config.sections():
        config_dict[section] = {}
        for option in config.options(section):
            config_dict[section][option] = config.get(section, option)
    
    # Convert dictionary to JSON
    os.environ["backend_dict"] = json.dumps(config_dict["Backend"])

def terraform_init(
    working_dir: str="./tf"
) -> ptf.Terraform:
    tf = ptf.Terraform(working_dir=working_dir)

    # initialize terraform
    return_code, stdout, stderr = tf.init(
        no_color=IsNotFlagged,
        backend_config=json.loads(os.getenv("backend_dict"))
    )
    print(stdout)
    print(stderr)
    print(return_code)

    return tf

def terraform_plan(
    tf: ptf.Terraform,
) -> None:
    # execute terraform plan
    return_code, stdout, stderr = tf.plan(
        no_color=IsNotFlagged
    )
    print(stdout)
    print(stderr)
    print(return_code)

    return tf

def terraform_apply(
    tf: ptf.Terraform,
    capture_output: str=None
) -> dict:

    # apply terraform
    return_code, stdout, stderr = tf.apply(
        no_color=IsNotFlagged,
        capture_output=capture_output,
        skip_plan=True
    ) #refresh=False,
    print(stdout)
    print(stderr)
    print(return_code)

    pprint.pprint(tf.output())

    return tf.output()

def terraform_destroy(
    tf: ptf.Terraform,
    capture_output: str=None
) -> None:
    
    # os.system("terraform destroy -auto-approve")
    # destroy terraform
    return_code, stdout, stderr = tf.destroy(
        no_color=IsNotFlagged,
        capture_output=capture_output,
        force=IsNotFlagged
    )
    print(stdout)
    print(stderr)
    print(return_code)
