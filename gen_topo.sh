if [ ! -d "mini-topologies" ]; then
    mkdir mini-topologies
fi

for file in `ls *graphml`
    do
    base_name=`basename $file`
    topo_name=${base_name%%.*}
    ./GraphML-to-Mininet2.py -f $topo_name.graphml -o mini-topologies/$topo_name.py --stp
done

