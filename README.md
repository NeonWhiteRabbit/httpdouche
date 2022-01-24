# httpDOUCHE

Usage: ./httpdouche ips.txt results.txt 200

<h3>httpDOUCHE v.1.0</h3>
<img src="https://raw.githubusercontent.com/n3onhacks/httpdouche/main/httpDOUCHE.jpg" alt="httpDOUCHE logo">

**!FOLLOW INSTALLATION INSTRUCTIONS BELOW!**<p>
httpDOUCHE is a script written in BASH (Shell Script) to clean a list of gathered domains/subs to create a list targeting a specific response code (ex: 200) prior to putting through a scanner (ex: nuclei) to save time. Written by n3on (<a href="https://www.twitter.com/@n3onhacks">@n3onhacks</a>).

<h1>Videos</h1>

<h3>POC - Using httpDOUCHE Video:</h3><p>
 https://www.youtube.com/watch?v=Cv3aUN5gSTg<p>
 
<h1>Usage</h1>
  
./httpdouche.sh <ips.txt> <results.txt> <response-code> <p>
(Ex: ./httpdouche.sh ips.txt results.txt 200)
 
<b>Note: **!MUST RUN httpDOUCHE AS $ROOT!**</b><p>

 <h1>Installation Instructions</h1>
>>cd /opt  (*must be in /opt folder to work)<p><p>
>>git clone https://github.com/n3onhacks/httpdouche.git<p>
>>chmod 777 -R httpdouche<p>
>>cd httpdouche<p>
>>./httpdouche.sh <ips.txt> <results.txt> <response-code><p>

<h1>Version Control</h1>
  
<h3>Version 1.0 release</h3>
-Initial release of httpDOUCHE<p>
 

