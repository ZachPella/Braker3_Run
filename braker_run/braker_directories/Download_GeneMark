# Mandatory Tools

## GeneMark-ETP

### Download and Installation

1. **Download GeneMark-ETP**:
   - You can download GeneMark-ETP from the following sources:
     - GitHub: [http://github.com/gatech-genemark/GeneMark-ETP](http://github.com/gatech-genemark/GeneMark-ETP)
     - Direct download: [https://topaz.gatech.edu/GeneMark/etp.for_braker.tar.gz](https://topaz.gatech.edu/GeneMark/etp.for_braker.tar.gz)

2. **Unpack and Install**:
   - Unpack the downloaded file and follow the installation instructions provided in the GeneMark-ETP’s `README` file.

### Setting Up GeneMark-ETP for BRAKER

- **Automatic Detection**:
  - If GeneMark-ETP is already in your `$PATH` variable, BRAKER will automatically detect the location of `gmes_petap.pl` or `gmetp.pl`.

- **Manual Configuration**:
  - If GeneMark-ETP is not in your `$PATH`, you can specify its location using one of the following methods:
    - **Environment Variable**: Set the `GENEMARK_PATH` environment variable.
    - **Command Line Argument**: Use the `--GENEMARK_PATH=/your_path_to_GeneMark_executables/` argument when running BRAKER.

- **Setting the Environment Variable**:
  - To set the `GENEMARK_PATH` environment variable for your current Bash session, run:
    ```bash
    export GENEMARK_PATH=/your_path_to_GeneMark_executables/
    ```
  - To make this setting persistent across all Bash sessions, add the above line to your startup script (e.g., `~/.bashrc`).

### Verification

- **Check Installation**:
  - You can verify that GeneMark-ES/ET/EP is installed correctly by:
    - Running the `check_install.bash` script.
    - Executing the examples in the `GeneMark-E-tests` directory.

### Compatibility

- **Downward Compatibility**:
  - GeneMark-ETP is downward compatible, meaning it also covers the functionality of GeneMark-EP and GeneMark-ET in BRAKER.

### Important Warning

- **Conda Environments**:
  - Installing GeneMark-ETP for BRAKER in conda environments has led to multiple issues reported by users. **We do not recommend using conda for this installation**.
  - **Recommended Alternative**: Use the Singularity image instead.
