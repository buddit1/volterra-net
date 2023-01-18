#! /bin/bash
python3.7 ./gendata.py
echo ""
echo "Running run_0.py"
python3.7 -u ./run_0.py
echo ""
echo "Running run_wo_sq.py"
python3.7 -u ./run_wo_sq.py



