# Installing AUGUSTUS

## Download and Unpack AUGUSTUS

1. **Download AUGUSTUS** from its master branch at the [AUGUSTUS GitHub Repository](https://github.com/Gaius-Augustus/Augustus).
2. **Unpack AUGUSTUS** and install it according to the instructions in the `README.TXT` file.

### Important Notes:
- Do **not** use outdated AUGUSTUS versions from other sources like Debian or Bioconda packages.
- **Compilation** is recommended to avoid problems with library versions.

---

## Compilation Instructions

Compilation instructions can be found in the `README.TXT` file located at `Augustus/README.txt`.

---

## Components of AUGUSTUS

- **augustus**: The gene prediction tool.
- **Additional C++ tools**: Located in `Augustus/auxprogs`.
- **Perl scripts**: Located in `Augustus/scripts`. Ensure Perl scripts are executable.

### bam2hints
- An essential component of BRAKER when run with RNA-Seq.
- Located in `Augustus/auxprogs/bam2hints`.
- Compilation troubleshooting instructions are in `Augustus/auxprogs/bam2hints/README`.

---

## BRAKER Integration

- BRAKER needs **writing access** to the `Augustus/config/` directory.
- **Global Installation**: Make the `config` directory writable to all users or copy it to a writable location.

---

## Configuration Directory

AUGUSTUS locates the `config` folder via the environment variable `$AUGUSTUS_CONFIG_PATH`.

- If not set, it looks in the path `../config` relative to the AUGUSTUS executable.
- Alternatively, supply the variable as a command-line argument:  
  `--AUGUSTUS_CONFIG_PATH=/your_path_to_AUGUSTUS/Augustus/config/`.

### Setting Environment Variable

-Add the following line to a startup script like `~/.bashrc` to make it available for all Bash sessions:

```bash
export AUGUSTUS_CONFIG_PATH=/your_path_to_AUGUSTUS/Augustus/config/
```

## Dockerfile
-Refer to the Dockerfile for installing AUGUSTUS as a Debian package.

## Important for BRAKER
-BRAKER expects the entire config directory at $AUGUSTUS_CONFIG_PATH.

-Separate Binary and Config: Recursively copy the unwritable config contents to a writable location.

-Example Commands
'''bash
cp -r /usr/bin/Augustus/config/ /home/yours/
export AUGUSTUS_CONFIG_PATH=/home/yours/augustus_config
export AUGUSTUS_BIN_PATH=/usr/bin
export AUGUSTUS_SCRIPTS_PATH=/usr/bin/augustus_scripts
```

## Modifying $PATH
- Current Bash Session
```bash
PATH=/your_path_to_augustus/bin/:/your_path_to_augustus/scripts/:$PATH
export PATH
```
-All Bash Sessions
Add the above lines to a startup script like ~/.bashrc.
