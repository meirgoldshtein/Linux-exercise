#!/bin/bash

# צבעים להדפסה
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # ללא צבע

# בדיקה אם הוזנה סיסמה
if [ -z "$1" ]; then
    echo -e "${RED}Error: No password provided.${NC}"
    exit 1
fi

password=$1

# בדיקה אם הסיסמה מכילה לפחות 10 תווים
if [ ${#password} -lt 10 ]; then
    echo -e "${RED}Error: Password is too short. It must be at least 10 characters long.${NC}"
    exit 1
fi

# בדיקה אם הסיסמה מכילה לפחות ספרה אחת, אות גדולה אחת ואות קטנה אחת
if ! [[ $password =~ [0-9] ]]; then
    echo -e "${RED}Error: Password must contain at least one digit.${NC}"
    exit 1
fi

if ! [[ $password =~ [A-Z] ]]; then
    echo -e "${RED}Error: Password must contain at least one uppercase letter.${NC}"
    exit 1
fi

if ! [[ $password =~ [a-z] ]]; then
    echo -e "${RED}Error: Password must contain at least one lowercase letter.${NC}"
    exit 1
fi

# אם כל התנאים מתקיימים, הסיסמה תקינה
echo -e "${GREEN}Success: Password is valid.${NC}"
exit 0
