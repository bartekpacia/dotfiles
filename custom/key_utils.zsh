# This file contains functions that make it easier to for me to
# access my SSH and GPG keys on a new machine.
# Example usage:
# $ get_ssh_key "id_rsa_raspi"

get_ssh_key() {
    key_name=$1
    key_path="$HOME/.ssh/$key_name"
    
    if [ -f "$key_path" ]; then
        echo "$key_path already exists. Nothing was done to it."
    else
        op get document "$key_name" > "$key_path" && chmod 400 "$key_path"
    fi
}
