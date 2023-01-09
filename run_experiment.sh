#! /bin/bash
python ./gendata.py
echo ""
echo "Running run_0.py"
python ./run_0.py
echo ""
echo "Running run_wo_sq.py"
python ./run_wo_sq.py



