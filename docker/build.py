#!/usr/bin/env python3

from colorama import Fore, Style
from subprocess import call
import argparse
import os

def banner(text):
    """ Print a banner on the console """
    print(Fore.YELLOW + '\n**********************************************')
    print(Fore.YELLOW + text.upper())
    print(Fore.YELLOW + '**********************************************\n')
    print(Style.RESET_ALL)

def parse_args():
    ''' Parse command line args '''
    parser = argparse.ArgumentParser()
    parser.add_argument('--db',
                        default='proyecto_2018_parcial',
                        help='MySQL databse for the App to use')
    parser.add_argument('--db-password',
                        default='admin',
                        help='MySQL password')
    parser.add_argument('--db-user',
                        default='root',
                        help='MySQL username')
    parser.add_argument('--repo-path',
                        help='Git repository ABS path')
    return parser.parse_args()

def main():
    """ Main function """
    args = parse_args()
    os.environ['MYSQL_DATABASE'] = args.db
    os.environ['MYSQL_PASSWORD'] = args.db_password
    os.environ['MYSQL_USERNAME'] = args.db_user
    os.environ['REPO_PATH'] = args.repo_path
    banner('Starting Docker compose')
    call(['docker-compose', 'up', '--build'])

    banner('Build Done!')


main()
