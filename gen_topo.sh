if [ ! -d "mini-topologies-done" ]; then
    mkdir mini-topologies-done
fi

for file in `ls mini-topologies/*graphml`
    do
    base_name=`basename $file`
    topo_name=${base_name%%.*}
    ./GraphML-to-Mininet.py -f mini-topologies/$topo_name.graphml -o mini-topologies-done/$topo_name.py --stp --cli --notip
done

echo "Topology Generation Complete."
echo ""
echo "*** NEXT STEP ***"
echo "*** PLease Place Your Additional Simulation Code in the <USER SIMULATION CODE HERE> area of .py Runnable Topology File. ***"

