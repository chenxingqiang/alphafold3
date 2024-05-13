import os
import subprocess
import argparse


def run_command(command):
    process = subprocess.Popen(
        command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    output, error = process.communicate()
    return output.decode('utf-8'), error.decode('utf-8')


def download_pdb_mmcif(download_dir):
    root_dir = os.path.join(download_dir, "pdb_mmcif")
    os.makedirs(root_dir, exist_ok=True)
    command = f"rsync -rlpt -v -z --delete --port=33444 rsync.rcsb.org::ftp_data/structures/divided/mmCIF/ {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_pdb_obsolete(download_dir):
    root_dir = os.path.join(download_dir, "pdb_obsolete")
    os.makedirs(root_dir, exist_ok=True)
    command = f"rsync -rlpt -v -z --delete rsync.wwpdb.org::ftp_data/structures/obsolete/mmCIF/ {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_sequence_clusters(download_dir):
    root_dir = os.path.join(download_dir, "sequence_clusters")
    os.makedirs(root_dir, exist_ok=True)
    url = "https://cdn.rcsb.org/resources/sequence/clusters/clusters-by-entity-40.txt"
    command = f"curl -sSL -o {root_dir}/clusters-by-entity-40.txt {url}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_ccd(download_dir):
    root_dir = os.path.join(download_dir, "ccd")
    os.makedirs(root_dir, exist_ok=True)
    base_url = "https://ftp.wwpdb.org/pub/pdb/data/monomers/components.cif"
    command = f"aria2c {base_url} {base_url}.gz --dir={root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_uniclust30(download_dir):
    root_dir = os.path.join(download_dir, "uniclust30")
    os.makedirs(root_dir, exist_ok=True)
    url = "https://wwwuser.gwdg.de/~compbiol/uniclust/2021_03/UniRef30_2021_03_hhsuite.tar.gz"
    command = f"aria2c {url} --dir={root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)
    tar_file = os.path.join(root_dir, "UniRef30_2021_03_hhsuite.tar.gz")
    command = f"tar -xzvf {tar_file} -C {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)
    os.remove(tar_file)


def download_uniref90(download_dir):
    root_dir = os.path.join(download_dir, "uniref90")
    os.makedirs(root_dir, exist_ok=True)
    command = f"rsync -rlpt -v -z --delete rsync.ebi.ac.uk::pub/databases/uniprot/uniref/uniref90/ {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_mgnify(download_dir):
    root_dir = os.path.join(download_dir, "mgnify")
    os.makedirs(root_dir, exist_ok=True)
    releases = ["2018_12", "2022_05"]
    for release in releases:
        command = f"rsync -rlpt -v -z --delete rsync.ebi.ac.uk::pub/databases/metagenomics/peptide_database/{release}/ {root_dir}/{release}"
        output, error = run_command(command)
        print(output)
        print(error)


def download_bfd(download_dir):
    root_dir = os.path.join(download_dir, "bfd")
    os.makedirs(root_dir, exist_ok=True)
    command = f"rsync -rlpt -v -z --delete rsync.rostlab.org::bfd/ {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_pdb_mmcif_assembly(download_dir):
    root_dir = os.path.join(download_dir, "pdb_mmcif_assembly")
    os.makedirs(root_dir, exist_ok=True)
    command = f"rsync -rlpt -v -z --delete --include='*.cif.gz' --exclude='*' rsync.rcsb.org::ftp_data/structures/divided/mmCIF/ {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_rfam(download_dir):
    root_dir = os.path.join(download_dir, "rfam", "14.9")
    os.makedirs(root_dir, exist_ok=True)
    command = f"rsync -rlpt -v -z --delete rsync.ebi.ac.uk::pub/databases/Rfam/14.9/ {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_jaspar(download_dir):
    releases = ["2022", "2024"]
    for release in releases:
        root_dir = os.path.join(download_dir, f"JASPAR{release}", "CORE")
        os.makedirs(root_dir, exist_ok=True)
        base_url = f"https://jaspar.elixir.no/download/data/{release}/CORE"
        files = [
            f"JASPAR{release}_CORE_non-redundant_pfms_jaspar.txt",
            f"JASPAR{release}_CORE_non-redundant_pfms_meme.txt",
            f"JASPAR{release}_CORE_non-redundant_pfms_transfac.txt",
            f"JASPAR{release}_CORE_redundant_pfms_jaspar.txt",
            f"JASPAR{release}_CORE_redundant_pfms_meme.txt",
            f"JASPAR{release}_CORE_redundant_pfms_transfac.txt",
            f"JASPAR{release}_CORE_non-redundant_pfms_jaspar.zip",
            f"JASPAR{release}_CORE_non-redundant_pfms_meme.zip",
            f"JASPAR{release}_CORE_non-redundant_pfms_transfac.zip",
            f"JASPAR{release}_CORE_redundant_pfms_jaspar.zip",
            f"JASPAR{release}_CORE_redundant_pfms_meme.zip",
            f"JASPAR{release}_CORE_redundant_pfms_transfac.zip"
        ]
        for file in files:
            url = f"{base_url}/{file}"
            command = f"wget -P {root_dir} {url}"
            output, error = run_command(command)
            print(output)
            print(error)


def download_rnacentral(download_dir):
    release = "21.0"
    root_dir = os.path.join(download_dir, "rnacentral", release)
    os.makedirs(root_dir, exist_ok=True)
    command = f"rsync -rlpt -v -z --delete rsync.ebi.ac.uk::pub/databases/RNAcentral/releases/{release}/ {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_selex(download_dir):
    root_dir = os.path.join(download_dir, "selex")
    os.makedirs(root_dir, exist_ok=True)
    files = [
        "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8009048/bin/NIHMS1670407-supplement-Supplemental_tables_S1-6.xlsx",
        "https://static-content.springer.com/esm/art%3A10.1038%2Fnature15518/MediaObjects/41586_2015_BFnature15518_MOESM33_ESM.xlsx"
    ]
    for file_url in files:
        file_name = os.path.basename(file_url)
        command = f"wget -P {root_dir} {file_url}"
        output, error = run_command(command)
        print(output)
        print(error)


def download_pdb_derived_data(download_dir):
    root_dir = os.path.join(download_dir, "pdb_derived_data")
    os.makedirs(root_dir, exist_ok=True)
    command = f"rsync -rlpt -v -z --delete rsync.rcsb.org::ftp_derived/derived_data/ {root_dir}"
    output, error = run_command(command)
    print(output)
    print(error)


def download_uniref(download_dir):
    root_dir = os.path.join(download_dir, "uniprot", "uniref")
    releases = ["release-2020_01", "release-2020_03", "release-2022_05"]
    for release in releases:
        release_dir = os.path.join(root_dir, release)
        os.makedirs(release_dir, exist_ok=True)
        command = f"rsync -rlpt -v -z --delete rsync.ebi.ac.uk::pub/databases/uniprot/previous_releases/{release}/uniref/ {release_dir}"
        output, error = run_command(command)
        print(output)
        print(error)


def main():
    parser = argparse.ArgumentParser(
        description="Download all required datasets.")
    parser.add_argument(
        "download_dir", help="Directory to download the datasets.")
    args = parser.parse_args()

    download_dir = args.download_dir

    download_pdb_mmcif(download_dir)
    download_pdb_obsolete(download_dir)
    download_sequence_clusters(download_dir)
    download_ccd(download_dir)
    download_uniclust30(download_dir)
    download_uniref90(download_dir)
    download_mgnify(download_dir)
    download_bfd(download_dir)
    download_pdb_mmcif_assembly(download_dir)
    download_rfam(download_dir)
    download_jaspar(download_dir)
    download_rnacentral(download_dir)
    download_selex(download_dir)
    download_pdb_derived_data(download_dir)
    download_uniref(download_dir)

    print("All datasets downloaded successfully!")


if __name__ == "__main__":
    main()
