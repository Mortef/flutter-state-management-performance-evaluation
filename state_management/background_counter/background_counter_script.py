import os
import subprocess
import time
import re

# Set loop variables
WARM_UP_COUNT = 10000
LOOP_AMOUNT = 1000
COUNT_AMOUNT = 10000

# List of directories to process
directories = ['counter_riverpod', 'counter_set_state', 'counter_bloc', 'counter_watchit', 'counter_getx', 'counter_mobx', 'counter_provider', 'counter_set_state', 'counter_riverpod', 'counter_watchit', 'counter_bloc', 'counter_mobx', 'counter_getx', 'counter_provider']

# Test directory
# directories = ['counter_riverpod']

# Initialize a list to hold results for all directories
all_times = []

def run_flutter_app(directory):
    # Navigate to the specified directory
    os.chdir(directory)
    print(f"Current directory: {os.getcwd()}")

    # Prepare the flutter command with dynamic variables
    command = f'flutter run --release --dart-define="WARM_UP_COUNT={WARM_UP_COUNT}" --dart-define="LOOP_AMOUNT={LOOP_AMOUNT}" --dart-define="COUNT_AMOUNT={COUNT_AMOUNT}"'
    
    # Start the process and interact with it
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, stdin=subprocess.PIPE, shell=True, text=True)
    
    # Regex to match the time output
    time_pattern = re.compile(r'Total time: (\d+) ms')

    # List to hold the time values for the current directory
    directory_times = []

    # Monitor the process output
    try:
        while True:
            output = process.stdout.readline()
            if output == '' and process.poll() is not None:
                break
            if output:
                print(output.strip())
                match = time_pattern.search(output)
                if match:
                    time_taken = match.group(1)
                    print(f"Total time: {time_taken} ms")
                    directory_times.append(int(time_taken))
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
    all_times.append((directory, directory_times))

    # Navigate back to the original directory
    os.chdir('..')

# Run the process for each directory
for dir in directories:
    run_flutter_app(dir)

# Create or append to the output file
with open("background_counter_benchmark_results.txt", "w") as output_file:
    for directory, times in all_times:
        output_line = f"Times recorded in {directory}: {times}\n"  # Add newline for better readability
        output_file.write(output_line)  # Write to the file

# At the end of all runs, print a confirmation message
print("All directories have been processed. Results saved to background_counter_benchmark_results.txt")
