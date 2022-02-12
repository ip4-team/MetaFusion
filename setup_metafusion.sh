set -euo pipefail

echo "Creating the conda env. You can remove it with:"
echo "conda remove --name metafusion --all"
conda env create -f envs/metafusion.yaml

echo "Downloading the required files..."
mkdir reference_files
cd reference_files
echo "ens_known_genes.renamed.ENSG.bed ..."
aria2c -c -x 5 https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/24427949/ens_known_genes.renamed.ENSG.bed
echo "Homo_sapiens.gene_info ..."
aria2c -c -x 5 https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/24427952/Homo_sapiens.gene_info
echo "human_g1k_v37_decoy.fasta ..."
aria2c -c -x 5 https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/24428066/human_g1k_v37_decoy.fasta
echo "human_g1k_v37_decoy.fasta.fai ..."
aria2c -c -x 5 https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/24428069/human_g1k_v37_decoy.fasta.fai
echo "blocklist_breakpoints.bedpe ..."
aria2c -c -x 5 https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/24570527/blocklist_breakpoints.bedpe

echo "Downloading FusionAnnotator files..."
mkdir ctat_genome_lib_build_dir
cd ctat_genome_lib_build_dir
echo "blast_pairs.idx ..."
aria2c -c -x 5 https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/24570560/blast_pairs.idx
echo "fusion_annot_lib.idx.idx ..."
aria2c -c -x 5 https://s3-eu-west-1.amazonaws.com/pfigshare-u-files/24570572/fusion_annot_lib.idx

echo "Done!"
