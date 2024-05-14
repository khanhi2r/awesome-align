from local.util import read_table
from local.clean_text import clean_line
from tqdm import tqdm


text_path_list = [
    "db/english_text",
    "db/english_to_malay_text",
]

text_dict = {}
for text_path in text_path_list:
    for utt, text in read_table(tqdm(list(open(text_path)), desc=f"loading {text_path} ..."), ts=(str, str)):
        if utt not in text_dict:
            text_dict[utt] = []
        text_dict[utt].append(text)

filtered_text_dict = {}
for utt, text_list in tqdm(list(text_dict.items()), desc="filtering text_dict"):
    if len(text_list) == len(text_path_list):
        filtered_text_dict[utt] = text_list


with open("data/enbm.src-tgt", "w") as f:
    for utt, text_list in tqdm(list(filtered_text_dict.items()), desc="writing ..."):
        text_list = [clean_line(text) for text in text_list]
        skip = False
        for text in text_list:
            if len(text) == 0:
                skip = True
                break
        if skip:
            continue
        f.write(" ||| ".join(text_list) + "\n")