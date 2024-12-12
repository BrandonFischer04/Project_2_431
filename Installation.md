Author: Brandon Fischer
Filename: Installation.md
Purpose: To explain how to install the coding language Curry as well as the necessary requirements



Installing Curry:

1. Download Curry Installation Files:
Visit the official Curry website or repository (Paket Web is common) to download the latest distribution.
Website: https://www.curry-lang.org/

2. Install Required Tools:
Ensure required tools such as GCC or equivalent compilers are installed.

3. Extract the Files:
If the downloaded file is compressed (e.g., .zip or .tar.gz), extract it to a preferred directory.

4. Set Up Environment Variables:
Add the Curry installation directory to your system's PATH to easily run Curry commands.

5. Build Curry from Source (if applicable):
Navigate to the extracted folder in a terminal or command prompt. Run:

bash
Copy code
./configure
make
make install
(Some installations may provide pre-built binaries; skip this step if binaries are available.)

6. Verify the Installation:
Open a terminal or command prompt and run:

bash
Copy code
curry --version
This should display the installed version of Curry.

7. Install Additional Packages:
Use Curry's package manager, if available, to install additional modules or libraries.


Requirements for installing Curry:

1. Operating System:
-Curry is supported on Linux, macOS, and Windows.

2. Software Dependencies:
-GCC or equivalent C/C++ compiler.
-GNU Make utility.
-Git (optional, for retrieving source code from repositories).

3. Memory and Disk Space:
-At least 4GB RAM.
-A minimum of 200MB free disk space for installation.

4. Environment:
-Terminal or command prompt with admin/root privileges.
-Ensure PATH is writable to add Curry's binaries.

5. Prerequisite Tools (for building from source):
-autoconf and automake for configuration scripts.
-libtool for linking dependencies.

6. Internet:
-Internet access to download Curry files and optional packages.