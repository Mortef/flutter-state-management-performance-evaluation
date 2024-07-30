import os
import subprocess
import time
import re

# Set loop variables
WARM_UP_COUNT = 10000
LOOP_AMOUNT = 1000
COUNT_AMOUNT = 10000

# List of directories to process
directories = ['data_fetch_riverpod', 'data_fetch_bloc', 'data_fetch_watchit', 'data_fetch_getx', 'data_fetch_mobx', 'data_fetch_provider', 'data_fetch_riverpod', 'data_fetch_watchit', 'data_fetch_bloc', 'data_fetch_mobx', 'data_fetch_getx', 'data_fetch_provider']

# Test values
# directories = ['data_fetch_riverpod']
# WARM_UP_COUNT = 5
# LOOP_AMOUNT = 5
# COUNT_AMOUNT = 10

# Initialize a list to hold results for all directories
all_times = []

# Benchmark save file name
benchmark_file = "data_fetch_benchmark_results.txt"

def run_flutter_app(directory):
    # Navigate to the specified directory
    os.chdir(directory)
    print(f"Current directory: {os.getcwd()}")

    # Prepare the flutter command with dynamic variables
    command = f'flutter run --release --dart-define="WARM_UP_COUNT={WARM_UP_COUNT}" --dart-define="LOOP_AMOUNT={LOOP_AMOUNT}" --dart-define="COUNT_AMOUNT={COUNT_AMOUNT}"'
    
    # Start the process and interact with it
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, stdin=subprocess.PIPE, shell=True, text=True)
    
    # Regex to match the time output
    start_pattern = re.compile(r'Starting loop (\d+)')
    fetch_pattern = re.compile(r'Fetched posts in (\d+) ms')
    loop_pattern = re.compile(r'Loop (\d+) completed in (\d+) ms')

    # List to hold the time values for the current directory
    fetch_times = []
    loop_times = []

    # Monitor the process output
    try:
        while True:
            output = process.stdout.readline()
            if output == '' and process.poll() is not None:
                break
            if output:
                print(output.strip())

                # Match loop start
                start_match = start_pattern.search(output)
                if start_match:
                    fetch_times = []  # Reset fetch times for the next loop

                # Match fetch times
                fetch_match = fetch_pattern.search(output)
                if fetch_match:
                    fetch_time = int(fetch_match.group(1))
                    fetch_times.append(fetch_time)

                # Match loop completion times
                loop_match = loop_pattern.search(output)
                if loop_match:
                    loop_time = int(loop_match.group(2))
                    time_taken = loop_time - sum(fetch_times)
                    print(f"Total time: {time_taken} ms")
                    loop_times.append(int(time_taken))

                if "All jobs finished" in output:
                    # Send 'q' to terminate the app when all jobs are finished
                    process.stdin.write('q\n')
                    process.stdin.flush()
                    break
    finally:
        # Wait for the process to finish and ensure it is terminated
        process.terminate()
        process.wait()
    
    # Append the times list for this directory to the all_times list
    all_times.append((directory, loop_times))

    # Navigate back to the original directory
    os.chdir('..')

# Run the process for each directory
for dir in directories:
    run_flutter_app(dir)

# Create or append to the output file
with open(benchmark_file, "w") as output_file:
    for directory, times in all_times:
        output_line = f"Times recorded in {directory}: {times}\n"  # Add newline for better readability
        output_file.write(output_line)  # Write to the file

# At the end of all runs, print a confirmation message
print(f"All directories have been processed. Results saved to {benchmark_file}")
