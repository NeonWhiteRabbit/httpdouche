# httpDOUCHE

<b>Usage: ./httpdouche ips.txt results.txt</b>

<h3>httpDOUCHE v.2.1</h3>
<img src="https://github.com/n3onhacks/httpdouche/blob/main/httpdouche_logo.jpg" alt="httpDOUCHE logo">

**!FOLLOW INSTALLATION INSTRUCTIONS BELOW!**<p>
httpDOUCHE is a script written in BASH (Shell Script) to clean a list of gathered domains/subs to create a list targeting response codes across the 200s/300s prior to putting through a scanner (ex: nuclei) to save time. Written by n3on (<a href="https://www.twitter.com/@n3onhacks">@n3onhacks</a>).

<h1>Videos</h1>

<h3>POC - Using httpDOUCHE Video:</h3><p>
 https://www.youtube.com/watch?v=Cv3aUN5gSTg<p>
 
<h1>Usage</h1>
  
./httpdouche.sh <ips.txt> <results.txt> <p>
(Ex: ./httpdouche.sh ips.txt results.txt)

 <h1>Installation Instructions</h1>
>>cd /opt<p><p>
>>git clone https://github.com/n3onhacks/httpdouche.git<p>
>>chmod 777 -R httpdouche<p>
>>cd httpdouche<p>
>>./httpdouche.sh ips.txt results.txt<p>

<h1>Version Control</h1>

<h3>Version 2.1 release</h3>
-Added /subtxt folder for easy subm3rge tool use<p>
 
<h3>Version 2.0 release</h3>
-Added multi-response grabbing capabilities<p>
-Added folder creation/individual file creation by response<br>
 -Added advanced output/reporting capabilities

 <h3>Version 1.0 release</h3>
-Initial release of httpDOUCHE<p>
 

