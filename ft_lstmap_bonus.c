/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cpalusze <cpalusze@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/11 17:47:25 by cpalusze          #+#    #+#             */
/*   Updated: 2022/11/14 15:56:31 by cpalusze         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*map;
	t_list	*head;
	t_list	*new;

	if (lst == NULL || del == NULL || f == NULL)
		return (NULL);
	map = ft_lstnew((*f)(lst->content));
	if (map == NULL)
		return (NULL);
	head = map;
	lst = lst->next;
	while (lst)
	{
		new = ft_lstnew((*f)(lst->content));
		if (new == NULL)
		{
			ft_lstclear(&map, del);
			break ;
		}
		map->next = new;
		map = map->next;
		lst = lst->next;
	}
	return (head);
}
