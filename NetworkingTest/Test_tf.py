import TerraformHelper



if __name__ == "__main__":
    
    TerraformHelper.load_env()
    tf = TerraformHelper.terraform_init()
    # TerraformHelper.terraform_plan(tf)
    # tf_output = TerraformHelper.terraform_apply(tf)
    # TerraformHelper.terraform_destroy(tf)