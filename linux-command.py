# Read the log file and store its content in a list
with open('access.log', 'r') as f:
    log_lines = f.readlines()

# Task 1: Extract and print IP addresses with successful GET requests
successful_ips = []
for line in log_lines:
    parts = line.split()
    if len(parts) >= 7 and parts[6] == '200' and parts[7] == '"GET':
        successful_ips.append(parts[0])

print("IP addresses with successful GET requests:")
print('\n'.join(successful_ips))

# Task 2: Calculate and print the total number of bytes transferred
total_bytes = sum(int(line.split()[-1]) for line in log_lines if '" 200' in line)
print("Total bytes transferred:", total_bytes)
