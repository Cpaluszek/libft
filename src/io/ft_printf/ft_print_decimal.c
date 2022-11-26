/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_decimal.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cpalusze <cpalusze@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/15 13:27:03 by cpalusze          #+#    #+#             */
/*   Updated: 2022/11/26 15:51:24 by cpalusze         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_print_decimal(const int nb)
{
	int				len;

	len = 0;
	if (nb >= 0)
		return (ft_print_unsigned_int(nb));
	write(1, "-", STDOUT_FILENO);
	return (1 + ft_print_unsigned_int(-nb));
}
