#!/bin/bash 
#A quick little bashscript by n3on @n3onhacks
#./httpdouche URLLIST.txt OUTPUTFILE.txt 200

#Some sexy ascii text
echo ""
echo ""
echo "           --------------------------------------------------------"
echo "           |  cleaning list of subs for only $3 status responses  |"
echo "           |             prior to running through scanner          |"
echo "           --------------------------------------------------------"
echo ""
echo ""
echo "                                               :yhy+."
echo "                                             sMMMNNd"
echo "                                            yMMNMMMy"
echo "          httpDOUCHE                       yMMMMMMy"
echo "                   v.1.0                   oMMMMMMs"
echo "                                          -MMMNMMh"
echo "           by                             dMMMMMN"
echo "                @n3onhacks               :MMMMMM+"
echo "                                         hMMMMMm"
echo "                                        .MMMMMMo"
echo "                                        /MMMMMM."
echo "                                        yMMMMMm"
echo "         Lets get nice and clean        dMMMMMy"
echo "                   for daddy            NMMMMMs"
echo "                                        MMMMMM+"
echo "                                        MMMMMMo"
echo "                                      -hMMMMMMN+"
echo "                                      oMMMMMMMMN"
echo "                                      sMMMMMMMMN"
echo "                                     +NMMMMMMMMMy-"
echo "                                  .oNMMMMMMMMMMMMMh/"
echo "                                .sNMMMMMMMMMMMMMMMMMd/"
echo "                               oNMMMMMMMMMMMMMMMMMMMMMd-"
echo "                             .dMMMMMMMMMMMMMMMMMMMMMMMMN+"
echo "                            -mMMMMMMMMMMMMMMMMMMMMMMMMMMMs"
echo "                           .dMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+"
echo "                           oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN"
echo "                           mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM/"                                   
echo "                          MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo"
echo "                          MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMs"
echo "                          NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM/"
echo "                           oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN"
echo "                           hMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:"
echo "                            dMMMMMMMMMMMMMMMMMMMMMMMMMMM/"
echo "                             .mMMMMMMMMMMMMMMMMMMMMMMMMM+"
echo "                              .mMMMMMMMMMMMMMMMMMMMMMMM+"
echo "                               .mMMMMMMMMMMMMMMMMMMMMMo"
echo "                                -mMMMMMMMMMMMMMMMMMMMo"
echo "                                 -mMMMMMMMMMMMMMMMMMs"
echo "                                  .oyhhhhhhhhhhhhhs:"
echo "            "                                           
echo ""                                                                                      
echo "  Cleaned domains/subs with $3 status code will be in $2 when completed."
echo ""
echo "  Wait patiently, this can take a few minutes depending on how many domains/subs you have."
echo ""
echo ""

#inputs                                                                                                                                                                                 
a=$1  #listToClean
b=$2  #savedFile
c=$3  #statusCode

#add to lines --can be done with just $(cat file.txt) but we want to have fun scripting dont we.
echo "#!/bin/bash" > /opt/httpdouche/cleaned_query.sh
File="$1"
Lines=$(cat $File)
for Line in $Lines
do
echo "curl -IL $Line -o /dev/null -w '%{http_code}\n' -s" >> /opt/httpdouche/douche_query.txt
done

#make sure shits clean and no repeats, create new bin file, chmod and execute it
awk '!a[$0]++' /opt/httpdouche/douche_query.txt > /opt/httpdouche/cleaned_query.txt 
cat /opt/httpdouche/cleaned_query.txt > /opt/httpdouche/cleaned_query.sh
chmod 777 /opt/httpdouche/cleaned_query.sh
/opt/httpdouche/./cleaned_query.sh > /opt/httpdouche/status_codes.txt

#grab the original url order to add status codes cleanly....or DOUCHED
cat /opt/httpdouche/cleaned_query.sh | cut -d " " -f 3 > /opt/httpdouche/combo1.txt

echo "...working...on....the...DOUCHING..." 
paste -d'\n' /opt/httpdouche/combo1.txt /opt/httpdouche/status_codes.txt | grep -B 1 200 > doucheroni.txt

cat doucheroni.txt | grep -v "200" > almostDone.txt
cat almostDone.txt | grep -v -e "--" > almostDone2.txt
cat almostDone2.txt > $2
echo "Complete. View clean URL only file to scan at $2"
cat $2

#remove unneeded files
rm /opt/httpdouche/douche_query.txt
rm /opt/httpdouche/cleaned_query.txt
rm /opt/httpdouche/status_codes.txt
rm /opt/httpdouche/combo1.txt
rm /opt/httpdouche/cleaned_query.sh
rm /opt/httpdouche/doucheroni.txt
rm /opt/httpdouche/almostDone2.txt
rm /opt/httpdouche/almostDone.txt
