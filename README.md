# simplechroot
Do you want to build a project without installing all the build deps on your main computer?
This script creates a lightweight, container-like environment that you can wipe clean when you're
finished with it. Simplechroot uses overlayFS to piggyback on your existing linux system,
letting you install packages and write files to a clone of your current machine's state without
actually making changes. While it's running, you can access the temporary file system in the
"simplechroot" directory. Note that, since this isn't an actual container, you don't have the same
security guarantees you'd get from, say, a VM. This is out of scope for the project, please don't
use simplechroot as a substitute for proper isolation.
