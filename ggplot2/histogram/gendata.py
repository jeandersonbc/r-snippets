#!/usr/bin/env python3
import csv
import random


random.seed(1234)


n = 100
lower_bound = 1
upper_bound = 150
genval = lambda: random.randint(lower_bound, upper_bound)

with open("sample.csv", "w", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=["value"])
    writer.writeheader()
    writer.writerows([{"value": genval()} for i in range(n)])

