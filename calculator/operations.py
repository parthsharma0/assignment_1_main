def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    
        
    return x / y

def main():
    print("Simple Calculator")
    print("Select operation:")

    # Hardcoded values
    choice = '1'  # Change this to '2', '3', or '4' for other operations
    num1 = 10  # First hardcoded number
    num2 = 5   # Second hardcoded number

    if choice in ['1', '2', '3', '4']:
        if choice == '1':
            print(f"{num1} + {num2} = {add(num1, num2)}")
        elif choice == '2':
            print(f"{num1} - {num2} = {subtract(num1, num2)}")
        elif choice == '3':
            print(f"{num1} * {num2} = {multiply(num1, num2)}")
        elif choice == '4':
            print(f"{num1} / {num2} = {divide(num1, num2)}")
    else:
        print("Invalid input. Please enter a number between 1 and 4.")

if __name__ == "_main_":
    main()