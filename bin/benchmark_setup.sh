
/usr/local/bin/mafft \
    --thread 40 --auto --inputorder \
    data/influenza/ird_influenzaA_HA_allspecies.fa \
    > target/flu/clusters/all.fasta

/usr/local/bin/mafft \
    --thread 40 --auto --inputorder \
    data/hiv/HIV-1_env_samelen.fa \
    > target/hiv/clusters/all.fasta

python bin/msa_subset.py

python bin/allmut2fasta.py h1
python bin/allmut2fasta.py h3
python bin/allmut2fasta.py hiv

cd MPF-BML/
matlab -r "fasta_name = '../target/flu/clusters/all_h1.fasta'; mut_name = '../target/flu/mutation/mutations_h1.fa'; main_MPF_BML(fasta_name, mut_name)"
matlab -r "fasta_name = '../target/flu/clusters/all_h3.fasta'; mut_name = '../target/flu/mutation/mutations_h3.fa'; main_MPF_BML(fasta_name, mut_name)"
matlab -r "fasta_name = '../target/hiv/clusters/all_BG505.fasta'; mut_name = '../target/hiv/mutation/mutations_hiv.fa'; main_MPF_BML(fasta_name, mut_name)"