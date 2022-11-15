/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cpalusze <cpalusze@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/08 14:49:25 by cpalusze          #+#    #+#             */
/*   Updated: 2022/11/08 14:49:29 by cpalusze         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static long long int	travel_digits(const char *nptr, int sign);
static int				ft_iswhitespace(const int c);

int	ft_atoi(const char *nptr)
{
	int					i;
	int					sign;

	i = 0;
	sign = 1;
	while (nptr[i] && ft_iswhitespace(nptr[i]))
		i++;
	if (nptr[i] == '-')
	{
		sign = -1;
		i++;
	}
	else if (nptr[i] == '+')
		i++;
	return ((int)travel_digits(nptr + i, sign));
}

static long long int	travel_digits(const char *nptr, int sign)
{
	long long int	res;
	int				i;

	i = 0;
	res = 0;
	while (ft_isdigit(nptr[i]))
	{
		if (sign == 1 && res >= (LLONG_MAX / 10) && (nptr[i] - '0') > 7)
			return (-1);
		if (sign == -1 && res >= (LLONG_MAX / 10) && (nptr[i] - '0') > 8)
			return (0);
		res = res * 10 + (nptr[i++] - '0');
	}
	return (res * sign);
}

static int	ft_iswhitespace(const int c)
{
	return (c == ' ' || c == '\t' || c == '\n' || c == '\r' \
			|| c == '\v' || c == '\f');
}
