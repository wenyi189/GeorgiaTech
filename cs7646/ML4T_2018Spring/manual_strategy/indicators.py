"""
Your code that implements your indicators as functions that operate on dataframes.
The "main" code in indicators.py should generate the charts that illustrate your
indicators in the report.

See Time Series Lecture: https://classroom.udacity.com/courses/ud501/lessons/4156938722/concepts/41444292690923

-- Use only the data provided for this course. You are not allowed to import external data.
-- For your report, trade only the symbol JPM. This will enable us to more easily compare results.
-- You may use data from other symbols (such as SPY) to inform your strategy.
-- The in sample/development period is January 1, 2008 to December 31 2009.
-- The out of sample/testing period is January 1, 2010 to December 31 2011.
-- Starting cash is $100,000.
-- Allowable positions are: 1000 shares long, 1000 shares short, 0 shares.
-- Benchmark: The performance of a portfolio starting with $100,000 cash, investing in 1000 shares of JPM and holding that position.
-- There is no limit on leverage.
-- Transaction costs for ManualStrategy: Commission: $9.95, Impact: 0.005.
-- Transaction costs for BestPossibleStrategy: Commission: $0.00, Impact: 0.00.
"""
import matplotlib
matplotlib.use('Agg')

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import datetime as dt
import os
from util import get_data, plot_data


def normalize_data(df):
    """
    Helper function to normalize Stock data by dividing by first day

    Taken from: https://classroom.udacity.com/courses/ud501/lessons/3975568860/concepts/41007386010923
    """
    return df / df.iloc[0, :]


def bollinger_bands(df, stocks=['JPM'], window=20):
    """
    """
    # Plot Stock Data
    ax = df[stocks].plot(title='JPM Bollinger Bands', label='JPM')

    # Compute Rolling mean using a 20 day window
    # Compute Rolling std using a 20 day window
    rm = pd.rolling_mean(df['JPM'], window=window)
    rm_std = pd.rolling_std(df['JPM'], window=window)
    upper_band = rm + rm_std * 2
    lower_band = rm - rm_std * 2

    # Add rolling mean to same plot
    rm.plot(label='Rolling mean', ax=ax)
    upper_band.plot(label='Upper Band', ax=ax)
    lower_band.plot(label='Lower Band', ax=ax)

    ax.set_xlabel("Date")
    ax.set_ylabel("Price")
    ax.legend(loc='lower left')
    plt.savefig('./bollinger.png')


def sma(df, stocks=['JPM'], window=20):
    """
    Calculate Simple Moving Average
    """
    # Plot Stock Data
    ax = df[stocks].plot(title='JPM SMA (Simple Moving Average)', label='JPM')

    # Compute Rolling mean using a 20 day window
    # Compute Rolling std using a 20 day window
    rm = pd.rolling_mean(df['JPM'], window=window)
    price_over_rm = df['JPM'] / rm

    # Add rolling mean to same plot
    rm.plot(label='SMA', ax=ax)
    price_over_rm.plot(label='Price / SMA', ax=ax)

    ax.set_xlabel("Date")
    ax.set_ylabel("Price")
    ax.legend(loc='lower left')
    plt.savefig('./sma.png')


def rate_of_change(df, stocks=['JPM'], window=20):
    """
    ROC is is a technical indicator that measures the percentage change between the most

    recent price and the price "window" days ago.
    REMOVE THESE BEFORE SUBMITTING
    https://www.quantinsti.com/blog/build-technical-indicators-in-python/#roc
    """
    N = df['JPM'].diff(window)
    D = df['JPM'].shift(window)

    ax = df[stocks].plot(title='JPM ROC (Rate of Change)', label='JPM')

    ROC = pd.Series(N/D, name='Rate of Change')
    ROC.plot(label='ROC', ax=ax)

    ax.set_xlabel("Date")
    ax.set_ylabel("Price")
    ax.legend(loc='lower left')
    plt.savefig('./roc.png')


def create_indicators(stocks=['JPM'], start_date=dt.date(2008, 1, 1), end_date=dt.date(2009, 1, 1)):
    """
    Develop and describe 3 technical indicators
    """
    prices = get_data(stocks, pd.date_range(start_date, end_date))

    # Normalize data
    prices = normalize_data(prices)

    print(prices.head())

    # Make Technical Indicators
    bollinger_bands(df=prices)
    sma(df=prices)
    rate_of_change(df=prices)


def main():
    """
    Do Stuff: In particular produce charts
    """
    create_indicators()


if __name__ == "__main__":
    main()
