
<h1>Create service to update nvidia drivers to latest testing version.</h1>


<h2>Steps</h2>

<h3>1. Create copy of pacman.conf</h3> 
<p><i>alternativly you can copy the pacman-testing.conf to the /etc/ dir (make sure to match permissions with pacman.conf)</i></p>
<p><code>sudo cp /etc/pacman.conf /etc/pacman-testing.conf</code></p>
<p>Uncomment the <b>extra-testing</b> and <b>multilib-testing</b> repos. </p>
<p>Remove or comment the <b>extra</b> and <b>multilib</b> repos. </p>
<p>Uncomment <b>CacheDir</b> and set it to <code>CacheDir = /srv/repo/nvidia/</code></p>

<h3>2. Create local repository</h3>
<p>create repo-folder</p>
<p><code>sudo mkdir -p /srv/repo/nvidia</code></p>
<p><code>sudo chown -R root:root /srv/repo</code></p>
<br>
<p>test pacman-testing.conf by downloading current testing drivers:</p>
<p><code>sudo pacman --config /etc/pacman-testing.conf -Sw --noconfirm extra-testing/nvidia-dkms extra-testing/nvidia-utils multilib-testing/lib32-nvidia-utils</code></p>
<p>Check with <code>ls /srv/repo/nvidia</code> if the files are in the right place</p>
<p>Create repo-database: <code>sudo repo-add nvidia.db.tar.gz *.pkg.tar.zst</code></p>
<h3>3. Setup Service</h3>
<p><i>alternativly copy update-nvidia-testing.sh to /usr/local/bin/update-nvidia-testing.sh</i></p>
<p>work in Progress, not done, im eating lunch atm. :)</p>
