
# Usage: python grag_zscore.py --f "file.pkl"

import argparse
import pickle

#parsing the necessary arguments####
parser=argparse.ArgumentParser()
parser.add_argument('--f',type=str,help='The psf file to read')

args=parser.parse_args()


print(max(pickle.load(open(args.f , "rb"))))
