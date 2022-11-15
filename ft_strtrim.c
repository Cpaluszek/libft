/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cpalusze <cpalusze@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/10 14:17:06 by cpalusze          #+#    #+#             */
/*   Updated: 2022/11/14 08:55:57 by cpalusze         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	get_start(char const *s1, char const *set);
static size_t	get_end(char const *s1, char const *set);

char	*ft_strtrim(char const *s1, char const *set)
{
	char	*trim;
	size_t	start;
	size_t	end;

	if (s1 == NULL)
		return (NULL);
	if (set == NULL)
		return (ft_strdup(s1));
	start = get_start(s1, set);
	end = get_end(s1, set);
	trim = ft_substr(s1, start, end - start + 1);
	return (trim);
}

static size_t	get_start(char const *s1, char const *set)
{
	long long int	i;

	i = 0;
	while (s1[i] && ft_strchr(set, s1[i]) != NULL)
		i++;
	return (i);
}

static size_t	get_end(char const *s1, char const *set)
{
	long long int	i;

	i = (long long int)ft_strlen(s1) - 1;
	while (i >= 0 && ft_strrchr(set, s1[i]) != NULL)
		i--;
	return (i);
}
